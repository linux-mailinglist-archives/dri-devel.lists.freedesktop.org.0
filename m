Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C55C7E049
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 12:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F1A10E153;
	Sun, 23 Nov 2025 11:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SmmKXNog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9608E10E0C0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 09:27:32 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2984dfae0acso52959885ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 01:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763890052; x=1764494852; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNN0MI0LidT4OFHOALkJ5vSdl55jONLNA9sdMaqYtkE=;
 b=SmmKXNogTgWL7/+QckBoeTrsid66XjyA36t4RZjflJr6rwef6velMcD5tarkyqrobi
 1Z0B8ihffdStbDGukcdWO2DwDyTYJg9BKklViuKiNoE3jtdqMElUUiDjDGj1WSxwbvGg
 VLzFco9BHq93DknCAUeZp+KhXPaVZZlW+eiqt5wd7d0D0+P8zH5Xu/dhyiKAHgBLyuXU
 gG3bSlB6B3dXi+Uc5Cj1HLYNkpG1E9VwW8FO1t6duYR6IBEyPg9cWLYFeH6MN/2X/C+y
 2RaXnTLSPj3bXNw9DqbN7WFcR+aVRqt6vlfWXIKKRtWvAU7QuhTGot1H858w2simEmVP
 dQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763890052; x=1764494852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kNN0MI0LidT4OFHOALkJ5vSdl55jONLNA9sdMaqYtkE=;
 b=g8krxUNoJx/DP52KLsu+N54v1v2ubXAcULeo0gmhNLlmkjRt1twfutQ/FsDAW747bE
 oFIU5rTRSNNzophzE72lZzIoMmND4DMTygPSgT7hw97ckc9q+Al/m7Z3v+yk/Ekps/K3
 X4t1TXFzAV53QcHGzhL4eS4aLW7w3yw/qAvtptHeT+/CvNDiY2cvMAjgECAk8HfB8QkJ
 V6lPYO2MdEjmqNqDFvocoGpaBdLgcHNW60KoAmeK8WVKmPdSq6kvh5cmnvznSV6YSLhA
 YQxekgLxG9iLQXWFLamjtRobUQvIQeJy+JxB7+R7S1Oqg7mgyJO2rK60rBxmJaaf5YqD
 FbrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs/v893Nld7dvn2J8fgheIubJEJIKCo81mAeXSJAtziJhT6C5ncJSstCzqH+PGpbItdtDWORhNM8o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzcms/kJe+TdktGKEbWkn8mCGWymyt0niPMLGcbFexAoe+wOMs0
 QZqg0Ji/13jPdJa4DHdBWHHVJzVMaKNpa8f67/v3WvPBgYtd9nAelH/5
X-Gm-Gg: ASbGncvlnXVy7uEprKxtQpQLXCLo4XpT4aROcnR5JY6ghQNnXxE+klFHx+Ib/yKkstV
 ZgRbNCKHq+lRRpC0djknTbfIRcj3m8s2GTwBrx5chHl4aQHzcVUqFV4BNAhNDbw+qKMBCiWOxac
 etr6c3baFt6EtqKedxTA+ZbwzbipbjZecU321p7+8bCFmzej/ud7uYkl9NX0Lg/7GMism4VPsX3
 P8O7CMQzKBayu0nXk8ln/nR4qN/AsKDbFmD6IgJ3j1UIGtO7jT9YRXROZKNCLZlCn/7IT9yrltH
 ucMSr6dj5X1xt1dckC23kLl8PB2O1+Z3UWP1KyCSRqOEgW2c/JqSpDg+5ZYdlHEoBGFFboQ5U3l
 /TxltA6GaEA/UIZEYtLmYpeejwa1QZ6ZyTg1dYGP/JJh0Z3xJxPQS4vILS61vxJ64JTpNqdMwWx
 +BV1J/gOwvACabJ7pvPTd7hozdEQ==
X-Google-Smtp-Source: AGHT+IFee8cb2TNSz47vMFblRZKC7Ldla9Ih927BxHiIgXSYRbtyZ2DKKrYa3dNyowUaxQz5HqlIJw==
X-Received: by 2002:a17:903:2f86:b0:295:7806:1d7b with SMTP id
 d9443c01a7336-29b6bf37e59mr102978025ad.45.1763890052139; 
 Sun, 23 Nov 2025 01:27:32 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 01:27:31 -0800 (PST)
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
Subject: [PATCH 09/10] samples: rust: Update ARef imports to use sync::aref
Date: Sun, 23 Nov 2025 14:54:37 +0530
Message-Id: <20251123092438.182251-10-shankari.ak0208@gmail.com>
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

Update call sites in `rust_debugfs.rs` to import `ARef`
from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 samples/rust/rust_debugfs.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/rust_debugfs.rs b/samples/rust/rust_debugfs.rs
index 025e8f9d12de..be245da577a1 100644
--- a/samples/rust/rust_debugfs.rs
+++ b/samples/rust/rust_debugfs.rs
@@ -39,7 +39,7 @@
 use kernel::sizes::*;
 use kernel::sync::atomic::{Atomic, Relaxed};
 use kernel::sync::Mutex;
-use kernel::{acpi, device::Core, of, platform, str::CString, types::ARef};
+use kernel::{acpi, device::Core, of, platform, str::CString, sync::aref::ARef};
 
 kernel::module_platform_driver! {
     type: RustDebugFs,
-- 
2.34.1

