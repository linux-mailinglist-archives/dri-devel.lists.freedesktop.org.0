Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26903A62C0D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 12:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2117710E217;
	Sat, 15 Mar 2025 11:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CSWyRbqs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CE510E386;
 Sat, 15 Mar 2025 02:43:21 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-728a274632eso1544026a34.3; 
 Fri, 14 Mar 2025 19:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742006600; x=1742611400; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AeYqJbrf6I+8xJpb1fpUMZYL3aN7NPBWHbe8L0cMhR4=;
 b=CSWyRbqsOfIcpqowBgTlQV2OXbSt6jv3G4mwcdbY7EhHlleDH8mDsSyGj/yrTtzbma
 0jPGz66sj6cs7KVU4IwQvucYLm/PjkLd8nj4SLqrpbDcHjzzTejhVtPcmh1w1nx2XOcE
 KY3+V/XZFULb4R7AaltDzkDrfrIsqitK9jyWYq0KUvltopo53/mhWU62LI9AnhXjKfTo
 qn1ja+q0XRrHOPdy7toNR5rgdE1PaOGFSTgmNcYM1fbmoivG7XBDaSjhetRbndJfUnAs
 yAotedlF1G482/imHeyYGPAKR7xTAc/9QWd6KHhdNNLe8UF+Rx70SXsrnkSASk5ax6A1
 qYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742006600; x=1742611400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AeYqJbrf6I+8xJpb1fpUMZYL3aN7NPBWHbe8L0cMhR4=;
 b=OPugG5u7h+MSfJne3o7Bh0qH5mcPDikXwQlFAhILjIGhtT8Bx8axIDWPjVWxQQBNkF
 RmoXxD6nsoXD2rPQR6qbd+dBT9uK1oRq87J/5/z89dbVUUE2A9HMtJ+6XWKlTqM2MqsM
 o1C3mylmifhXynPFfMjx9NHeSgvSGIUc94CUlGE69Cs7VRs4QsI9eaaxIHxgJR0jtpm3
 tqkwwHHK5NDj/0iqJjewD2K5pl+FBQrPIhmJIPBEO97bDmXRgla6++KKqBWCAjhbLj3e
 V3xw+xvWxD6sJ+Ioz+yF8hgtBODzXnIgjTbOn131SDqY4Ecw3s/YeiLLoPJ0/+U3cREz
 5csQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/lykIds5Xex8MkU2Rgl8FlUMLnpW40Jri9URkZm7fmda6W8yiaqgjCMo/Kodkxh0rqYPzAznp/Q==@lists.freedesktop.org,
 AJvYcCUnnJosWGIIeXabWc7sOoL0GtzMdGdz9BLkBygMh+4Z4eKmyrawhEvOJjNE98TTtEYRagyjM8QeBgM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywx/947UO5p7OFCvfZ0MkQNDAl437/F9EpAnXkNZiaEhxfAUePn
 6QpW6N0oudGD6hmPlb0RSeoO8MhF1M/q4yX29NjJWZzFoOOrjJBO
X-Gm-Gg: ASbGncu12kFBBMjIcFQzs20WzGqt8tyjJ4qpXm6wcMj/kXJ0IdaJid3gCt+8FdWn/yS
 4BFMzduIw/E16XEqjTkzSf2cHqhGbVoKa1fVgZTu2Mpqvh9ssmxu/dKB8ONpqNXWOxcNn1uGlDp
 RBF0AN9fFA4mfuzOMOSvRupiSQe/m8kuU/jujc8kvLpaJOuM/cSKTwEb/UQtYvnZBQfiP4TFsOP
 aPzNzKCM96XFhlST3cBWmIBjnGvkxNzJm5hNaTtqNUwDM5y6djQbSSW9C++WBboa3JYg5Yod5jk
 EACEFQt6p2yEpKhp2oeqAfLEUE97ULJUGrV7kfXBRFJZaOfn9jq83pgiLgbWJAnhQrVOH08Nyhh
 bG68DwF76I9ru0p3U
X-Google-Smtp-Source: AGHT+IFyEBBnvYzkXYuE6/AMMpI3VNwP3HqbWsB1HV45tb/drP1bhozEjDZ54crecAv68ZJodxXxoQ==
X-Received: by 2002:a05:6830:dc9:b0:72b:872f:efca with SMTP id
 46e09a7af769-72bbc5423ddmr3120313a34.27.1742006600316; 
 Fri, 14 Mar 2025 19:43:20 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-72bb26bb82dsm882990a34.32.2025.03.14.19.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 19:43:19 -0700 (PDT)
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
Subject: [PATCH 1/3] rust: alloc: add Vec::truncate method
Date: Fri, 14 Mar 2025 21:42:33 -0500
Message-ID: <20250315024235.5282-2-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315024235.5282-1-andrewjballance@gmail.com>
References: <20250315024235.5282-1-andrewjballance@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 15 Mar 2025 11:49:29 +0000
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

implements the equivalent to the std's Vec::truncate
on the kernel's Vec type.

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/kernel/alloc/kvec.rs | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ae9d072741ce..75e9feebb81f 100644
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
+        // [new_len, len) is guaranteed to be valid because [0, len) is guaranteed to be valid
+        let drop_range = len..self.len();
+
+        // SAFETY:
+        // we can safely ignore the bounds check because we already did our own check
+        let ptr: *mut [T] = unsafe { self.get_unchecked_mut(drop_range) };
+
+        // SAFETY:
+        // it is safe to shrink the length because the new length is
+        // guaranteed to be less than the old length
+        unsafe { self.set_len(len) };
+
+        // SAFETY:
+        // - the dropped values are valid `T`s
+        // - we are allowed to invalidate [new_len, old_len) because we just changed the len
+        unsafe { ptr::drop_in_place(ptr) };
+    }
 }
 
 impl<T: Clone, A: Allocator> Vec<T, A> {
-- 
2.48.1

