Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF29A63545
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 12:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31D410E12A;
	Sun, 16 Mar 2025 11:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y/DYCQBY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5FF10E12A;
 Sun, 16 Mar 2025 11:17:18 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-5fe86c16f5dso1664412eaf.1; 
 Sun, 16 Mar 2025 04:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742123838; x=1742728638; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rG31lQCRCRFDdqfRdvTtPaHQMIPvTMGOzZjBUIipjbU=;
 b=Y/DYCQBYN+OCWKulFrVo9OEzyD80a6CsJ7bE2eiP9WHNc+pgz3PvbYRt0XaWK5cdlc
 +aLKimQDhgJsNFGmdZXiPU4hbHf8F0Mmz4r74jgq6c5mj3sw9ZOLmOzxucXCS/G2Qk2f
 XErlama+ML7R9WMtpUweZKwTNjB/Ca9uY2szfQJjZO/fJ2HlD31nOk6+TgPk99g6JLEw
 a611zRfpB0UxaalSG8LggFu5lUDJH4VngwlG8ZqDKLFZaA6NkpWS/ngsofI84Kf5w8h6
 goocid+a0d73D0tYXpwu5EC+sqwLYktjRVjBOoaihdDC1KCI/J7d2pbmQbnoGGHeZ5X8
 wM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742123838; x=1742728638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rG31lQCRCRFDdqfRdvTtPaHQMIPvTMGOzZjBUIipjbU=;
 b=hthB0KjWf7lW3Ca/TWUNHwyfeFSKT2MV9yrVsAvu0fPiPydhvKfirVmpLOXrHeXGCe
 7LNCltrGfStqZMHfU5GDt9XdKaU0Hg25v/vb1z36TPb9nTYSFVxBzC2pWgL9v2j0w2yz
 qm26kiwUNvkctZ1brbOcOZk9XwXjha8A5HkAQHQSfGcjzb+n6r2wo2UiSnQKfBl6Lr5V
 sIdu9ZCkhBNuTZpA95yYFWR6RX39aYjQMNkr+LI2zyDi5s1DlH4cqwrn96G3T6YAf6Uu
 nh4dzmN5KeFUdlRvxxubMKDYNAJVg4BHNFXZNe5Yk+k3vyB0t7Q3pjBPG3IPtfOzt8JY
 UzRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmfCODyDoH/hI0pn0Knroqm97yLcptZNafE4nyj7Fn6PBCLXbK9C6SXB/fUXg00tMP+fO49yfFmwQ=@lists.freedesktop.org,
 AJvYcCWH1dGkfJ+PQ7UYhvOPcaaS4TR0SwFv1WGNgxsxzzTUSQXbFNGN8oIUWaU54wp04BZHGXf1W9KDug==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9DOHZy0Rgg7gpXUsUbuJofCXFljJngSJxqIFNWB8/KwevemuW
 vV3NmgfI6MHoGFZSYAqWdMQJdeYVLAiWbkXfKBE7U1vc4Vxa98qB
X-Gm-Gg: ASbGncugubPyPiIKda4Zp9SwXvx7+uqsEnKhy00ufpDYvP9goHpJbZ4oSEe09mIGrlL
 4UmHD9ZB2WzXk19f8ByY+3qmUsXN+GsZc1jDXZpuukfnCv7YeaPheI9RdA4rL40G5WFvn5x8fA+
 OHs4ms8t5Lo4brYNPZdcvAl9lW8qyL6CiERQh4GLpTZuFBPurr07e9HEYxL+5a6pmwyrfA/39Hu
 snVuYOBdohMnrmtyG+TtH0CUBfFiVLH4wdF88nBZ6MszboELbjJQ2c5vnjMNVJJTRpFag88EGfN
 IFF/it9OByByu2uefyA7SZ2tuy446We7ATQaXhEgxOEHjPT+K+n3ANJX/J2ihM5OzJzLCpocYv8
 0KTEcvVhGzSAkXbtHLhD/oAZ2F6A=
X-Google-Smtp-Source: AGHT+IGXuZj7CrskJpVU66WVbrVD3w1oJfKPbLyD5/hTVj8h9n+BL/mvcQD3fQGQ0RBjIV8G4AgMVA==
X-Received: by 2002:a05:6808:3849:b0:3f9:aeb6:8621 with SMTP id
 5614622812f47-3fdee2791bamr4613083b6e.3.1742123838137; 
 Sun, 16 Mar 2025 04:17:18 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 5614622812f47-3fe832ce015sm715978b6e.7.2025.03.16.04.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Mar 2025 04:17:17 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 corbet@lwn.net, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, andrewjballance@gmail.com, acourbot@nvidia.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: [PATCH v2 1/3] rust: alloc: add Vec::truncate method
Date: Sun, 16 Mar 2025 06:16:42 -0500
Message-ID: <20250316111644.154602-2-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316111644.154602-1-andrewjballance@gmail.com>
References: <20250316111644.154602-1-andrewjballance@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

implement the equivalent to the std's Vec::truncate
on the kernel's Vec type.

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/kernel/alloc/kvec.rs | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ae9d072741ce..18bcc59f0b38 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -452,6 +452,42 @@ pub fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocEr
 
         Ok(())
     }
+
+    /// Shortens the vector, setting the length to `len` and drops the removed values.
+    /// If `len` is greater than or equal to the current length, this does nothing.
+    ///
+    /// This has no effect on the capacity and will not allocate.
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = kernel::kvec![1, 2, 3]?;
+    /// v.truncate(1);
+    /// assert_eq!(v.len(), 1);
+    /// assert_eq!(&v, &[1]);
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn truncate(&mut self, len: usize) {
+        if len >= self.len() {
+            return;
+        }
+
+        let drop_range = len..self.len();
+
+        // SAFETY: `drop_range` is a subrange of `[0, len)` by the bounds check above.
+        let ptr: *mut [T] = unsafe { self.get_unchecked_mut(drop_range) };
+
+        // SAFETY:
+        // - this will always shrink the vector because of the above bounds check
+        // - [`new_len`, `self.len`) will be dropped through the call to `drop_in_place` below
+        unsafe { self.set_len(len) };
+
+        // SAFETY:
+        // - the dropped values are valid `T`s by the type invariant
+        // - we are allowed to invalidate [`new_len`, `old_len`) because we just changed the
+        //   len, therefore we have exclusive access to [`new_len`, `old_len`)
+        unsafe { ptr::drop_in_place(ptr) };
+    }
 }
 
 impl<T: Clone, A: Allocator> Vec<T, A> {
-- 
2.48.1

