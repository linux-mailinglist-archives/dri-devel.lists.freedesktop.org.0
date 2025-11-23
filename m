Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE31C7E037
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 12:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269CD10E139;
	Sun, 23 Nov 2025 11:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="caYype7d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C62410E0C0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 09:26:53 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-297ec50477aso13709985ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 01:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763890013; x=1764494813; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jcsZ1pYdc/lZZufwkk7hmx3zrC9Zk2tE9eYLDhtARFw=;
 b=caYype7docGKKeNGLCfHaCbmWIKZZMGXvon554YMwnO0mK8JkZOAzCw9pkGA7O+Trt
 6PT3ZBSPXTOehRmYFOhQ2GaNGuWfPp5gAXYB5HulJHQJ7g4nrxHn93a/nTettbKzipF4
 iHuYfq2PpWAIEZLhhwDo4TXFNqjQGYr0AK8Ba7UYjc5mA94HfSVar44+prs4QLYgdejK
 +l0lWbVa2mekfRS4VQKnjxG8jbFUFLK/Xyyl+ilwsVn6p7k8aZcLSfQPEZX9ChEs3tvG
 YaFsJroRUlMJp+Zd1wcMMlDq2EQ3Dpa8h50vUqrVRU7t8P7JgfEF6EUE/HtHKLtBovdv
 cbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763890013; x=1764494813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jcsZ1pYdc/lZZufwkk7hmx3zrC9Zk2tE9eYLDhtARFw=;
 b=s0jZURo7DNOhCmR9SgX4ZL4cALYMxzSceu6rnsO1QKO5jqMRVPYrmXsMsd1v2MMBp5
 jKymDuhu9Y9wZCIEm/TQ/Mo6qZ4YIUBFxMFnx/TK3dzGOReoWZg0BcZkRQ/G3Trzjdj9
 FkxDvCwTxx2FUSfSJXxev1j+Si3B6WvnL5RXNCPrdRkXQS8wQsjzbSp+no5nrX8T+MXI
 IOyGiJlcqR9i+269s0PccQBq8EpwNdK/Vkv+pzfQk+z+SVv9H04X4rX7wby/shh/4xcf
 5rrPOIBWKqwrUwvUUoeYYEo9pZtpevN7cImdG6usfB+64I6lP+SsAg2K18HOQiU5HcsR
 sBbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZMSMGoY5gSNJipuSF7QTMkiG0YBs79gZEoeHsBQ6XCeMbdQhd7emoX+/f20BOyilaj6YTtNmK4mA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZh+eUfE4/XIvd6xd3mdeFEexKlT55XWglka61Yt5KjphbANBh
 PEEysMJA0NPHBvXRhSY9VtaFEhUWQiLKgZcbb+RXy/yIqe6UgSBGJNXM
X-Gm-Gg: ASbGncteA6J79WzjnMDWTVzd3oIyExh7f8rFTaVzgoqVf+0/DRLK1OnJJadyGfpzd0Z
 UmRxwz3Zv+v/OFg2U9NXukyx1Bc0gncLicpMrU4IdoKFNpTbprcRxhLbmqxr0TIoIEWdp6FvgBn
 fEXim+aRGgDJCG/FScQrgEjhlf2DhtmfSZ+/zK0oezIF+tZFd5GBlyrL3cs1VuK6mnnUIeKNqtn
 3r+ogERHfdf7qDbDJcvPCeEdsLIT08/+/mYhir+zSDcUTiwi5ZPZviyLgAdqrsQBAHS96abxUxa
 OZb/yxm9kw3a6ZUq88GXm5BhuIioqKf9OurlhNqVJ5wF0ZZefN5tJcpeKHWnC+sEhmpO2+e2Oi9
 PF6Ki9G7OGBwAWps75L+3rX30ce1Qqdp91MJu/liKxWl/bOZ7ymQY2+79o7zUPSywFFwlqbN3ZB
 OwrvQXDUyRiQyIDIcwhSVqypSQ4g==
X-Google-Smtp-Source: AGHT+IEPaSiAglOPtRohHhMD3F7poU82nQz/JA+b9mPjFhoImXk6hT3H7zPq8hH/JIUpP2uJO5DptA==
X-Received: by 2002:a17:902:ef4f:b0:295:82d0:9baa with SMTP id
 d9443c01a7336-29b6bfa8cd3mr100768505ad.17.1763890013033; 
 Sun, 23 Nov 2025 01:26:53 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 01:26:52 -0800 (PST)
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
Subject: [PATCH 06/10] rust: kernel: Update ARef and AlwaysRefCounted imports
 to use sync::aref
Date: Sun, 23 Nov 2025 14:54:34 +0530
Message-Id: <20251123092438.182251-7-shankari.ak0208@gmail.com>
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

Update call sites in `pwm.rs` to import `ARef`
and `AlwaysRefCounted` from `sync::aref`
instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 rust/kernel/pwm.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index cb00f8a8765c..1605d13d5d64 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -13,7 +13,8 @@
     devres,
     error::{self, to_result},
     prelude::*,
-    types::{ARef, AlwaysRefCounted, Opaque}, //
+    sync::aref::{ARef, AlwaysRefCounted},
+    types::Opaque, //
 };
 use core::{marker::PhantomData, ptr::NonNull};
 
-- 
2.34.1

