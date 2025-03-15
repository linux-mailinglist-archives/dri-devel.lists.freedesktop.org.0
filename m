Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC98A62C10
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 12:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422C310E39E;
	Sat, 15 Mar 2025 11:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j8nSOy9N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBA010E386;
 Sat, 15 Mar 2025 02:43:25 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-72737740673so1582130a34.3; 
 Fri, 14 Mar 2025 19:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742006605; x=1742611405; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ozI6bHXFcVEFtJyDWKZZMCOOL14Yw6gl5milkPaugjs=;
 b=j8nSOy9NXPhhwveU0V0GeE0ebyYOw11V5exzgxDueHkNFNgEq/pIG5e7BIK2WX8gis
 u8oOf6HmilZGYI7Bdfh55OJAHlDOkiAFAnspVv/BKXhYuawlZa/1wc/apC/ikFgIwrvO
 K+7r59PVV1wMIvS3d75bLppITLwbhRzXFjAY95cWicX9isABFRgzqykjAZcCZhOSSACk
 a5doAXYXYYNV+kd8cHxbhh14B+r4n2Mo7JKYE1DC9WX67OpWcDxPdDnYSAKN4oBBe9VB
 vo6fXIsmQIsPDX9MtcRQTjHK9DARiMG3yr1/PDctQKopA8RChgcZMM8MRxkXndK6JmFc
 PLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742006605; x=1742611405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ozI6bHXFcVEFtJyDWKZZMCOOL14Yw6gl5milkPaugjs=;
 b=liti+1ylOXQBMZCh+L57yUpkaxEFAy3ULXkGa3XgXbWVzdI0CTwssnDeJpMhwg14I3
 /b1rM10KY4nV6jkwE5W/ynGdandTeXJPlPMV0Zl8A0v0Qqws2QLT2NZMOJRdfYgbF0YV
 5ai3g5hMLjQd/6F1+Hk4OmbkFuo4dOEijrPiVUD5gk31JOTDqtpHX1zMMx/ErZaBsSW3
 FT95kIVv9CsQTCAiCr0shizLRu78D1ktH05dJqy/q8Yht2NFo3Y0WJth0pqWdkGc3cF9
 HZ3j8Ijrmz+r6MpRGA+dM3RMlE05EpNoun+/pBTWB7syAmSGOyVmpEJ7Zh7NOWSJ+J2y
 MJjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuXnMghmgO3k8xSfgz0V9GvJf2jlzo3+D9xw94lLGlK9hTNZZC+7c7tpD/+jobospw2ab+9LNuXg==@lists.freedesktop.org,
 AJvYcCXisiyDabIkmYI/tpNf/HzpbV/JxkfXZieJrLZIWVwXy76aXER7hrqJouVjL52gzSbczbW9HlQ5zcQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzjw922h7ZSK57Avv6wYFnfTvvhXDnMlYGCJ0PyrdXikl2P2P5C
 skTSke/HDIio4jNNj/Joz7oopHjgTxFIplzNuwklBwBom96H1U3L
X-Gm-Gg: ASbGncta3bR+kaxwwoPXP7YPmD0yoX4mLdeoLx2SPfGePKftRwVfmvqrE3Dz1FxptAp
 KlTIDBYMD6L0fMkIOj0oEpE8PHD4L9UOQpia907U3y0VOJ9zKEAQVhT/wNlt/zKzlz5crHNXWmi
 8ONU/gJ3kGpN1FOUSj/kicEH3gfiVI09epK1yhFm41/qia70UijPAwgfhP0Pe9z6SDaEXljHuej
 JiHgGI1yR3ojIAsrzRcATpz9zLPFR0xIa6KPfiAyJuw5l7RDVOgc5O38Wa7xOB24TU0ARBKBQaj
 F2EeDpw/rBHzCZME8fwjqEIZ/yIO19gJl/JsQ919JfLzVnjYeLgDJc9sNlIHvN5E4sasywXsUzA
 KHA8vQwwXoD+CCl8J
X-Google-Smtp-Source: AGHT+IHn4T8ft66JDSAaRetx3LPtJm4QIIBG5/KyMQuMrsIYaO6ONBeR2Co+yM+xjG3i/KhZyNmJew==
X-Received: by 2002:a05:6830:8216:b0:72b:7faa:93a6 with SMTP id
 46e09a7af769-72bbc48cdd9mr2033320a34.14.1742006605244; 
 Fri, 14 Mar 2025 19:43:25 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-72bb26bb82dsm882990a34.32.2025.03.14.19.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 19:43:25 -0700 (PDT)
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
Subject: [PATCH 2/3] rust: alloc: add Vec::resize method
Date: Fri, 14 Mar 2025 21:42:34 -0500
Message-ID: <20250315024235.5282-3-andrewjballance@gmail.com>
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

implemnts the equivalent of the rust std's Vec::resize
on the kernel's Vec type.

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 rust/kernel/alloc/kvec.rs | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 75e9feebb81f..cbfef2e56f9c 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -554,6 +554,31 @@ pub fn from_elem(value: T, n: usize, flags: Flags) -> Result<Self, AllocError> {
 
         Ok(v)
     }
+
+    /// Resizes the [`Vec`] so that `len` is equal to `new_len`.
+    ///
+    /// If `new_len` is smaller than `len`, the `Vec` is [`Vec::truncate`]d.
+    /// If `new_len` is larger, each new slot is filled with clones of `value`.
+    ///
+    /// # Example
+    /// ```
+    /// let mut v = kernel::kvec![1, 2, 3]?;
+    /// v.resize(1, 42, GFP_KERNEL)?;
+    /// assert_eq!(&v, &[1]);
+    ///
+    /// v.resize(3, 42, GFP_KERNEL)?;
+    /// assert_eq!(&v, &[1, 42, 42]);
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn resize(&mut self, new_len: usize, value: T, flags: Flags) -> Result<(), AllocError> {
+        if new_len > self.len() {
+            self.extend_with(new_len - self.len(), value, flags)
+        } else {
+            self.truncate(new_len);
+            Ok(())
+        }
+    }
 }
 
 impl<T, A> Drop for Vec<T, A>
-- 
2.48.1

