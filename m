Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC41FC7E04F
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 12:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6882210E15B;
	Sun, 23 Nov 2025 11:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ezxpezwd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E4210E126
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 09:25:46 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-29558061c68so45435105ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 01:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763889946; x=1764494746; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BHBuqhkFJfYaNnj9M7q8FhjsYY3lIhigbe8268nPJsA=;
 b=ezxpezwdN2DzGx1iQNyEz4Gu0RDL3JppCwY897VjWNJz8D8bsnhzzradqDS2M6dGao
 hGo3VbdiEGjrvXJJg7OVhApylC6FlEyrP6gBST4c2wplWy+aKkbt+1CG0eVbiF09UKzJ
 Phrb7saKa5nMyzW0wAwzQOz//hz87S+meZbkwwsbJiN5YmzAsYnNnOCtBu087c0OiHqP
 M0xoXWSBeWvvcKk8Vax9jYjx+OJ1kbg+DeVyv20W1H7o7lkjBzVSfyY19J572kiFoV6Y
 21L0MA+xJfbp4eWn80Z+DDDpWi4kXj15Gm4EJurb/FlAiKAika0FpqszV2kiYyk7zpzF
 2tNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763889946; x=1764494746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BHBuqhkFJfYaNnj9M7q8FhjsYY3lIhigbe8268nPJsA=;
 b=IT0OsIV6O+jmbf7art12GRL70Bhmde0ElNXj3RpBZkZAukkkQ+lcbcyC8QBTdiy2T6
 luIg1bTPqgegzWC+iseTbNvntl0GB2DVySGUyR4Cs+oMbhj+CoKD5hohqRolnsUmElt9
 kVGSynofttjr+UIVGct/v0i6BKHPRWx3xJafCThKt5U/nnx3t9cuX3iY1QW/DGX+7CC5
 VRUJ+mHcq5sZ5o8gM1iG0ladaPX6LU1xuVqjlpYadrXFoOGg72VFt+Xz79KD3PSmTkJ1
 WsyDmB8aDaI/Yc7wQuBsrxUm/PS3qLLVNedWGfoaacA7kxOMe6hcWxbCrijQDIQu64s5
 jMBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsiSVQO8wP48QNtq9LPer0iUQxht8bhXZsyO4G30/2/mzjWRhWX0m7J+vMgHoM6rZyoPBrNjErn78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZVRfp8YyJvXS8bfmn1thOLMFMltSv4yS0l2QYf08rqI3iABPd
 824pE3RYyGvEEN7u5vt87lZWsBx3cPpm0R0prvjljiOP/UKD0fs9Z/Ig
X-Gm-Gg: ASbGncvH4JSv7p2nXnc+C4VdwWHf0O4VG6CviTlzTPdjoep6f36cyz2C3/sfU9RQdRY
 i55FqlR/sHNZZf2IuW4YguQH9EfdGH+SahXnmuCOq1Bt7DyGXkd+1QqTXsdazdInT0muFa/yz5G
 RimsawU75gMrv0U9x5/0YI3QzOfY/D5T8xlFCUGYZep0tV4ztpKvCy2wZvg3i06yY5nfdDqFk8M
 yiqwJjGw911J7+noj3nn4c44oqPMtlXCItvdQOXsUlk7ol4TbVjCuUXbj18P1CvGIW7bHig/NH+
 LQujgn7hJ84jUe2eWZvSKc9MMSwNQzAL5X6r0bXA3jb2Q4sT5y72TqiUC+/kaKJuFaqw879vRwS
 NpdMOZBUWAUGJ0TrYFs59w0iHIJNs4VFb5ExdRO1dQrWV86N/loYKSxxy8IYsdAtxalBotVJau4
 Z6FSMn5zG6JB5Q+gOiYOP7wPEc1A==
X-Google-Smtp-Source: AGHT+IHeRFkTHVTA6Srefmm0HL5WijnlyHgpdTjb/dQ8CxktDbPnk0dZz+0OIDZ55NxQOWacfTdN2A==
X-Received: by 2002:a17:903:947:b0:28e:a70f:e879 with SMTP id
 d9443c01a7336-29b6be8cb2dmr88701485ad.1.1763889946269; 
 Sun, 23 Nov 2025 01:25:46 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b138c08sm100811105ad.25.2025.11.23.01.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 01:25:45 -0800 (PST)
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
Subject: [PATCH 01/10] drivers: android: binder: Update ARef imports from
 sync::aref
Date: Sun, 23 Nov 2025 14:54:29 +0530
Message-Id: <20251123092438.182251-2-shankari.ak0208@gmail.com>
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

Update call sites in binder files to import `ARef`
from `sync::aref` instead of `types`.

This aligns with the ongoing effort to move `ARef` and
`AlwaysRefCounted` to sync.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1173
Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 drivers/android/binder/process.rs | 2 +-
 drivers/android/binder/thread.rs  | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index e5237e9ec552..1409129ff82a 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -27,11 +27,11 @@
     seq_print,
     sync::poll::PollTable,
     sync::{
+        aref::ARef,
         lock::{spinlock::SpinLockBackend, Guard},
         Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
     },
     task::Task,
-    types::ARef,
     uaccess::{UserSlice, UserSliceReader},
     uapi,
     workqueue::{self, Work},
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 7e34ccd394f8..033af3ce352e 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -16,9 +16,8 @@
     seq_file::SeqFile,
     seq_print,
     sync::poll::{PollCondVar, PollTable},
-    sync::{Arc, SpinLock},
+    sync::{aref::ARef, Arc, SpinLock},
     task::Task,
-    types::ARef,
     uaccess::UserSlice,
     uapi,
 };
-- 
2.34.1

